module UsersHelper
  def category_name(category)
    t("activerecord.models.user.category.#{category}")
  end
end
