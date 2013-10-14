class Arena::Contribution < Arena

  # GET contribution - Returns contribution information for a given contribution ID
  def self.find(id)
    # example: Arena::Contribution.find(392847)
    get_with_signature("/contribution/#{id}")
  end

  # GET Contribution List - Returns a list of contributions. Additionally, you can pass query string parameters to filter the list
  def self.where(query)
    # Example: Arena::Contribution.where({"LastName" => "Meisenholder"}) - this will bring back contribution data
    get_with_signature('/contribution/list', {query: query})
  end

  # GET Batch - Returns the batch that matches the given batch ID
  def self.find_batch(id)
    # example: Arena::Contribution.find_batch(15)
    get_with_signature("/batch/#{id}")
  end

  # GET Batch List - Returns a list of batches. Additionally, you can pass query string parameters to filter the list
  def self.list_batch(query)
    # example: Arena::Contribution.list_batch({"BatchName" => "New Batch"})
    get_with_signature('/batch/list', {query: query})
  end

  # GET Batch Type List - Returns a list of batch types
  def self.list_batchtype
    # example: Arena::Contribution.list_batchtype
    get_with_signature("/batchtype/list")
  end

  # GET Fund - Returns the fund that matches the given fund ID
  def self.find_fund(id)
    # example: Arena::Contribution.find_fund(2596)
    get_with_signature("/fund/#{id}")
  end

  # GET Fund List - Returns a list of funds
  def self.list_fund
    # example: Arena::Contribution.list_fund
    get_with_signature("/fund/list")
  end

  # GET Project - Returns the project that matches the given project ID
  def self.find_project(id)
    # example: Arena::Contribution.find_project(2)
    get_with_signature("/project/#{id}")
  end

  # GET Project List - Returns a list of projects
  def self.list_project
    # example: Arena::Contribution.list_project
    get_with_signature("/project/list")
  end

  # POST Add Contribution to Batch - Adds a contribution to the batch with the given batch ID
  def self.add_contribution_to_batch(batch_id, amount)
    # Example: Arena::Contribution.add_contribution_to_batch("15", "20.0000")
    data = <<-xml
    <Contribution>
      <ContributionDate>2013-04-04T00:00:00</ContributionDate>
      <ContributionFunds>
        <ContributionFund>
          <Amount>#{amount}</Amount>
          <ContributionFundId>579</ContributionFundId>
          <ContributionId>348</ContributionId>
          <Fund>
            <Active>true</Active>
            <CanPledge>true</CanPledge>
            <EndDate>2020-08-01T00:00:00</EndDate>
            <FundDescription>CD301P3$</FundDescription>
            <FundId>2596</FundId>
            <FundName>General Fund</FundName>
            <OnlineName/>
            <StartDate>2012-01-01T00:00:00</StartDate>
            <TaxDeductible>true</TaxDeductible>
          </Fund>
          <FundId>2596</FundId>
          <Project>
            <Code>229</Code>
            <Description/>
            <Name>Main Friday 7pm Service</Name>
            <ProjectId>1</ProjectId>
          </Project>
          <ProjectId>1</ProjectId>
        </ContributionFund>
      </ContributionFunds>
      <ContributionId>999</ContributionId>
      <CurrencyAmount>#{amount}</CurrencyAmount>
      <CurrencyTypeId>671</CurrencyTypeId>
      <CurrencyTypeValue>Cash</CurrencyTypeValue>
      <Memo>101 : 1</Memo>
      <PersonId>52441</PersonId>
      <PersonInformation>
        <FirstName>Testfirst</FirstName>
        <LastName>Testlast</LastName>
        <NickName>Test</NickName>
      </PersonInformation>
      <PersonLink>person/56109</PersonLink>
      <RefundContributionId>-1</RefundContributionId>
      <TransactionNumber>[None]</TransactionNumber>
    </Contribution>
    xml

    post_with_signature("/batch/#{batch_id}/contribution/add", {body: data})
  end

  def self.add_contribution2_to_batch(batch_id, amount)
    # Example: Arena::Contribution.add_contribution2_to_batch("15", "20.0000")
    data = <<-xml
    <Contribution>
      <ContributionDate>2013-04-04T00:00:00</ContributionDate>
      <ContributionFunds>
        <ContributionFund>
          <Amount>#{amount}</Amount>
          <ContributionFundId>579</ContributionFundId>
          <ContributionId>348</ContributionId>
          <Fund>
            <Active>true</Active>
            <CanPledge>true</CanPledge>
            <EndDate>2020-08-01T00:00:00</EndDate>
            <FundDescription>CD301P3$</FundDescription>
            <FundId>2596</FundId>
            <FundName>General Fund</FundName>
            <OnlineName/>
            <StartDate>2012-01-01T00:00:00</StartDate>
            <TaxDeductible>true</TaxDeductible>
          </Fund>
          <FundId>2596</FundId>
          <Project>
            <Code>229</Code>
            <Description/>
            <Name>Main Friday 7pm Service</Name>
            <ProjectId>1</ProjectId>
          </Project>
          <ProjectId>1</ProjectId>
        </ContributionFund>
      </ContributionFunds>
      <ContributionId>999</ContributionId>
      <CurrencyAmount>#{amount}</CurrencyAmount>
      <CurrencyTypeId>671</CurrencyTypeId>
      <CurrencyTypeValue>Cash</CurrencyTypeValue>
      <Memo>101 : 1</Memo>
      <PersonId>1234567</PersonId>
      <RefundContributionId>-1</RefundContributionId>
      <TransactionNumber>[None]</TransactionNumber>
    </Contribution>
    xml

    post_with_signature("/batch/#{batch_id}/contribution/add", {body: data})
  end

  # POST Add Batch - Adds a batch
  def self.add_batch
    # example: Arena::Contribution.add_batch
    data = <<-xml
    <Batch>
      <BatchDate>2013-04-08T00:00:00</BatchDate>
      <BatchDateEnd>1900-01-01T00:00:00</BatchDateEnd>
      <BatchName>River Batch</BatchName>
      <BatchTypeName>Unknown</BatchTypeName>
      <Finalized>True</Finalized>
    </Batch>
    xml

    post_with_signature("/batch/add", {body: data})
  end

  # POST Update Batch - Updates the batch with the given batch ID
  def self.update_batch(batch_id)
    # example: Arena::Contribution.update_batch(15)
    data = <<-xml
    <Batch>
      <BatchDate>2013-04-08T00:00:00</BatchDate>
      <BatchDateEnd>1900-01-01T00:00:00</BatchDateEnd>
      <BatchName>Updated Batch</BatchName>
      <BatchTypeName>DinersClub</BatchTypeName>
      <Finalized>False</Finalized>
    </Batch>
    xml

    post_with_signature("/batch/#{batch_id}/update", {body: data})
  end

end