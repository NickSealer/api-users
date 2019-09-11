class SearchService
  def self.search_user(users, query)
    users.where("name LIKE '%#{query}%'")
  end
end
