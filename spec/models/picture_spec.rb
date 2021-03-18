require 'rails_helper'
RSpec.describe Picture, type: :model do
  before do
    @picture = FactoryBot.build(:picture)
  end

  describe '画像の保存' do
    context '画像が投稿できる場合' do
      it '画像とテキストとアカウントがあれば投稿できる' do
        expect(@picture).to be_valid
      end
    end
    context '画像が投稿できない場合' do
      it 'テキストが空では投稿できない' do
        @picture.text = ''
        @picture.valid?
        expect(@picture.errors.full_messages).to include("制作ソフトや製作期間を入力してください")
      end 
      it 'アカウントが空では投稿できない' do
        @picture.account = ''
        @picture.valid?
        expect(@picture.errors.full_messages).to include("その他アカウントのURLを入力してください")
      end    
      it 'ユーザーが紐付いていなければ投稿できない' do
        @picture.user = nil
        @picture.valid?
        expect(@picture.errors.full_messages).to include("Userを入力してください")
      end
      it '画像が空では投稿できない' do
        @picture.image = nil
        @picture.valid?
        expect(@picture.errors.full_messages).to include("画像を入力してください")
      end
    end
  end
end
