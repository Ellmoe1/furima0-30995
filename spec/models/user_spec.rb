require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'A3bjkD'
        @user.password_confirmation = 'A3bjkD'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameがない場合は登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailがない場合は登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@が含まれていないと登録できないこと' do
        @user.email = 'hogehoge.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'A3bbk'
        @user.password_confirmation = 'A3bbk'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'password:半角英数混合(半角英語のみ)' do
        @user.password = 'Lq3Mg6K66'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが半角英字だけでは登録できないこと' do
        @user.password = 'abceefg'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが半角数字だけでは登録できないこと' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが全角だと登録できないこと' do
        @user.password = 'AABB123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'lastnameがない場合は登録できないこと' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end

      it 'firstnameがない場合は登録できないこと' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end

      it 'lastnamekanaがない場合は登録できないこと' do
        @user.lastnamekana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastnamekana can't be blank")
      end

      it 'firstnamekanaがない場合は登録できないこと' do
        @user.firstnamekana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstnamekana can't be blank")
      end

      it 'birthdateがない場合は登録できないこと' do
        @user.birthdate = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdate can't be blank")
      end

      it 'lastnameが全角入力でなければ登録できないこと' do
        @user.lastname = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname is invalid')
      end

      it 'firstnameが全角入力でなければ登録できないこと' do
        @user.firstname = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname is invalid')
      end

      it 'lastnamekanaが全角カタカナでなければ登録できないこと' do
        @user.lastnamekana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastnamekana is invalid')
      end

      it 'firstnamekanaが全角カタカナでなければ登録できないこと' do
        @user.firstnamekana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstnamekana is invalid')
      end
    end
  end
end
