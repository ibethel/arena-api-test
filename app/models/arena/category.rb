class Arena::Category < Arena

  def self.all
    get_with_signature('/category/list', query: {'name' => 'Bob'})
    #get_with_signature('security/objecttype/list', query: {'name' => 'Bob'})
  end

end