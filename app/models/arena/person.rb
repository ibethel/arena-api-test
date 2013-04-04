class Arena::Person < Arena

  def self.find(id)
    get_with_signature("/person/#{id}")
  end

  def self.where(query)
    # example {'lastName' => 'Lyric'}
    get_with_signature("/person/list",{query: query})
  end

  def self.test_update(first, middle, last, nick)
    data = <<-xml
      <Person>
        <FirstName>#{first}</FirstName>
        <LastName>#{last}</LastName>
        <MiddleName>#{middle}</MiddleName>
        <NickName>#{nick}</NickName>
     </Person>
    xml

    post_with_signature("/person/1297/update", {body: data})
  end

  def self.test_update_names(id, first, middle, last, nick)
    data = <<-xml
      <Person>
        <FirstName>#{first}</FirstName>
        <LastName>#{last}</LastName>
        <MiddleName>#{middle}</MiddleName>
        <NickName>#{nick}</NickName>
     </Person>
    xml

    post_with_signature("/person/#{id}/update", {body: data})
  end

  def self.test_create_person_unless_exists(param1, param2, first, last)
    # Example command line call: Arena::Person.test_create_person_unless_exists('lastName', 'Lyric', 'Andrew', 'Lyric')
    # param1 = 1st paramter needed for the GET/person/list call - example - lastName to search on Last Name, firstName to search on FIrst Name
    # param2 = 2nd parameter needed for the GET/person/list call - example - if param1 is lastName, then param2 would be the actual last name you are searching for
    response = where({"#{param1}" => "#{param2}"})

    if response.parsed_response.to_s == "{\"PersonListResult\"=>{\"Persons\"=>nil}}"
      test_create_person(first, last)

      response = where({"#{param1}" => "#{last}"})

      if response.parsed_response.to_s == "{\"PersonListResult\"=>{\"Persons\"=>nil}}"
        puts "#{first} #{last} was not inserted"
      else
        puts "#{first} #{last} was inserted"
      end
    else
      puts "#{first} #{last} already exists"
    end
  end

  def self.test_create_person(first, last)
    # Example command line call: Arena::Person.test_create_person('Andrew', 'Lyric')
    # Address portion of XML matches API documentation provided but is generating error: Cannot insert the value NULL into column 'address_type_luid'
    # Get Successful insert of data if Address is removed from XML
    data = <<-xml
      <Person>
        <Addresses>
          <Address>
            <AddressID>141</AddressID>
            <AddressTypeID>41</AddressTypeID>
            <AddressTypeValue>Main/Home Address</AddressTypeValue>
            <City>Redding</City>
            <Country>US</Country>
            <Latitude>35.162344</Latitude>
            <Longitude>-89.714422</Longitude>
            <PostalCode>96003-8055</PostalCode>
            <Primary>true</Primary>
            <State>CA</State>
            <StreetLine1>2046 Charade Way Apt 1</StreetLine1>
            <StreetLine2/>
          </Address>
        </Addresses>
        <Age>51</Age>
        <AreaName/>
        <BirthDate>1961-11-02T00:00:00</BirthDate>
        <BlobLink>https://arenadev.ibethel.org/CachedBlob.aspx?localfile=generic_male_adult.jpg</BlobLink>
        <BusinessPhone/>
        <CampusID>1</CampusID>
        <CampusName>Campus 1</CampusName>
        <CellPhone/>
        <FamilyID>2</FamilyID>
        <FamilyMemberRoleID>29</FamilyMemberRoleID>
        <FamilyMemberRoleValue>Adult</FamilyMemberRoleValue>
        <FirstActiveEmail>samitest@ibethel.org</FirstActiveEmail>
        <FirstName>#{first}</FirstName>
        <Gender>Male</Gender>
        <HomePhone>(530) 123-4567</HomePhone>
        <LastName>#{last}</LastName>
        <MemberStatusID>958</MemberStatusID>
        <MemberStatusValue>Member</MemberStatusValue>
        <NickName>Sam</NickName>
        <PersonGUID>a41061d9-6419-4502-a0c6-3df2b877eaff</PersonGUID>
        <PersonID>3</PersonID>
        <PersonLink>person/3</PersonLink>
        <RecordStatusValue>Active</RecordStatusValue>
      </Person>
    xml

    response = post_with_signature("/person/add", {body: data})
  end

  def self.test_update(person_id, firstname, middlename, lastname, nickname)
    data = <<-xml
      <Person>
        <ActiveMeter>0</ActiveMeter>
        <Addresses>
          <Address>
            <AddressID>30489</AddressID>
            <AddressTypeID>41</AddressTypeID>
            <AddressTypeValue>Main/Home Address</AddressTypeValue>
            <City>Redding</City>
            <Country>US</Country>
            <PostalCode>96003-8055</PostalCode>
            <Primary>true</Primary>
            <State>CA</State>
            <StreetLine1>2046 Charade Way Apt 1</StreetLine1>
            <StreetLine2 nil=" true "/>
          </Address>
        </Addresses>
        <Age>44</Age>
        <AnniversaryDate>1900-01-01T00:00:00</AnniversaryDate>
        <AttributesLink>person/9af04fd4-5329-4257-ba11-ea8e237f9678/attribute/list</AttributesLink>
        <BirthDate>1968-07-18T00:00:00</BirthDate>
        <BlobID>-1</BlobID>
        <BlobLink>https://arenadev.ibethel.org/CachedBlob.aspx?localfile=generic_male_adult.jpg</BlobLink>
        <DateCreated>1998-11-24T10:20:24</DateCreated>
        <DateModified>2011-11-09T09:44:49.41</DateModified>
        <DisplayNotesCount>0</DisplayNotesCount>
        <FamilyID>997</FamilyID>
        <FamilyLink>family/997</FamilyLink>
        <FamilyMemberRoleID>29</FamilyMemberRoleID>
        <FamilyMemberRoleValue>Adult</FamilyMemberRoleValue>
        <FamilyMembersCount>4</FamilyMembersCount>
        <FamilyName>Lyric Family</FamilyName>
        <FirstName>#{firstname}</FirstName>
        <ForeignKey>4826</ForeignKey>
        <ForeignKey2>0</ForeignKey2>
        <FullName>Andrew Lyric</FullName>
        <Gender>Male</Gender>
        <GivingUnitID>P1297</GivingUnitID>
        <InactiveReasonID>-1</InactiveReasonID>
        <InactiveReasonValue>Unknown</InactiveReasonValue>
        <IncludeOnEnvelope>false</IncludeOnEnvelope>
        <LastName>#{lastname}</LastName>
        <MaritalStatusID>965</MaritalStatusID>
        <MaritalStatusValue>Married</MaritalStatusValue>
        <MedicalInformation nil=" true "/>
        <MemberStatusID>-1</MemberStatusID>
        <MemberStatusValue>Unknown</MemberStatusValue>
        <MiddleName>#{middlename}</MiddleName>
        <NickName>#{nickname}</NickName>
        <Notes nil=" true "/>
        <NotesLink>person/9af04fd4-5329-4257-ba11-ea8e237f9678/note/list</NotesLink>
        <OrganizationID>1</OrganizationID>
        <PersonGUID>9af04fd4-5329-4257-ba11-ea8e237f9678</PersonGUID>
        <PersonID>1297</PersonID>
        <PersonLink>person/9af04fd4-5329-4257-ba11-ea8e237f9678</PersonLink>
        <RecordStatusID>0</RecordStatusID>
        <RecordStatusValue>Active</RecordStatusValue>
        <RegionName nil=" true "/>
        <SuffixID>-1</SuffixID>
        <SuffixValue>Unknown</SuffixValue>
        <TitleID>-1</TitleID>
        <TitleValue>Unknown</TitleValue>
      </Person>
    xml

    post_with_signature("/person/#{person_id}/update", {body: data})
  end

end