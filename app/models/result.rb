class Result < ActiveRecord::Base

  # 検索のためのメソッドを定義
  # https://qiita.com/budougumi0617/items/d98fc15adea4dab438e7

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Result.where(['name LIKE ?', "%#{search}%"])
    else
      Result.all #全て表示。
    end
  end
end
