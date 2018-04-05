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
      col_names = ["name", "kokuho_res1", "kokuho_res2", "kokuho_res3", "kouki_res1", "kouki_res2", "kouki_res3"]
      col_names_label = ["keyword", "国保レセプト枚数", "国保患者数", "国保LTC利用者数", "後期レセプト枚数", "後期患者数", "後期LTC利用者数"]
      csv << col_names_label
      all.each do |res_temp|
        csv << res_temp.attributes.values_at(*col_names)
      end
    end
  end


end
