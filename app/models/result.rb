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

  # csvデータDLのためのメソッドを定義
  # http://ruby-rails.hatenadiary.com/entry/20141119/1416398472

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |res_temp|
        csv << res_temp.attributes.values_at(*column_names)
      end
    end
  end


end
