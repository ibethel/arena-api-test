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

  def self.test_update2
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
        <Emails>
          <Email type=" array ">
            <Email>
              <Address>andrewl@ibethel.org</Address>
            </Email>
            <Email>
              <Address>talyric@gmail.com</Address>
            </Email>
          </Email>
        </Emails>
        <FamilyID>997</FamilyID>
        <FamilyLink>family/997</FamilyLink>
        <FamilyMemberRoleID>29</FamilyMemberRoleID>
        <FamilyMemberRoleValue>Adult</FamilyMemberRoleValue>
        <FamilyMembersCount>4</FamilyMembersCount>
        <FamilyName>Lyric Family</FamilyName>
        <FirstName>Timothy</FirstName>
        <ForeignKey>4826</ForeignKey>
        <ForeignKey2>0</ForeignKey2>
        <FullName>Andrew Lyric</FullName>
        <Gender>Male</Gender>
        <GivingUnitID>P1297</GivingUnitID>
        <InactiveReasonID>-1</InactiveReasonID>
        <InactiveReasonValue>Unknown</InactiveReasonValue>
        <IncludeOnEnvelope>false</IncludeOnEnvelope>
        <LastName>Lyric</LastName>
        <MaritalStatusID>965</MaritalStatusID>
        <MaritalStatusValue>Married</MaritalStatusValue>
        <MedicalInformation nil=" true "/>
        <MemberStatusID>-1</MemberStatusID>
        <MemberStatusValue>Unknown</MemberStatusValue>
        <MiddleName>A.</MiddleName>
        <NickName>Andrew</NickName>
        <Notes nil=" true "/>
        <NotesLink>person/9af04fd4-5329-4257-ba11-ea8e237f9678/note/list</NotesLink>
        <OrganizationID>1</OrganizationID>
        <PersonGUID>9af04fd4-5329-4257-ba11-ea8e237f9678</PersonGUID>
        <PersonID>1297</PersonID>
        <PersonLink>person/9af04fd4-5329-4257-ba11-ea8e237f9678</PersonLink>
        <Phones>
          <Phone type=" array ">
            <Phone>
              <Extension nil=" true "/>
              <Number>(530) 276-8088</Number>
              <PhoneTypeID>276</PhoneTypeID>
              <PhoneTypeValue>Main/Home</PhoneTypeValue>
            </Phone>
            <Phone>
              <Extension nil=" true "/>
              <Number>(530) 351-1746</Number>
              <PhoneTypeID>282</PhoneTypeID>
              <PhoneTypeValue>Cell</PhoneTypeValue>
            </Phone>
          </Phone>
        </Phones>
        <RecordStatusID>0</RecordStatusID>
        <RecordStatusValue>Active</RecordStatusValue>
        <RegionName nil=" true "/>
        <SuffixID>-1</SuffixID>
        <SuffixValue>Unknown</SuffixValue>
        <TitleID>-1</TitleID>
        <TitleValue>Unknown</TitleValue>
      </Person>
    xml
  end

end