class New < ApplicationRecord
  has_many :comments

  def self.GetEditedNews
    result = New.all.sort_by(&:created_at).reverse
    result.each do |aux|
      if aux.body.length > 999 then
        aux.body = aux.body[0,998]
        aux.body = aux.body + "..."
      end
    end
    return result
  end
end
