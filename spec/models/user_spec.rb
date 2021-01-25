require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  context '登録できる場合' do
    it 'nickname, email, password, password_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end

  context '登録できない場合' do
    it 'nicknameが存在しない場合、登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが存在しない場合、登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '入力されたemailがすでに登録されている場合、登録できない' do
      @user.save
      @another_user = FactoryBot.build(:user, email: @user.email)
      @another_user.valid?
      expect(@another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'emailに@が含まれていない場合、登録できない' do
      @user.email = "testtest"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが存在しない場合、登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字より少ない場合、登録できない' do
      @user.password = "1a1a1"
      @user.password_confirmation = "1a1a1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordが英字のみの場合、登録できない' do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordが数字のみの場合、登録できない' do
      @user.password = "111111"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordが全角英数字のみの場合、登録できない' do
      @user.password = "１Ａ１Ａ１Ａ"
      @user.password_confirmation = "１Ａ１Ａ１Ａ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'password_confirmationが存在しない場合、登録できない' do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'passwordとpassword_confirmationが一致しない場合、登録できない' do
      @user.password_confirmation = "a1aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
