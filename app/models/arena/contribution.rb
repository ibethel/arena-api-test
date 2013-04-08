class Arena::Contribution < Arena

  def self.find(id)
    get_with_signature("/contribution/#{id}")
  end

  def self.find_batch(id)
    get_with_signature("/batch/#{id}")
  end

  def self.where(query)
    # Example: Arena::Contribution.where({'LastName' => 'Meisenholder'}) - this will bring back contribution data
    get_with_signature('/contribution/list', {query: query})
  end

  def self.list_batchtype
    get_with_signature("/batchtype/list")
  end

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
            <FundId>16</FundId>
            <FundName>General Fund</FundName>
            <OnlineName/>
            <StartDate>2012-01-01T00:00:00</StartDate>
            <TaxDeductible>true</TaxDeductible>
          </Fund>
          <FundId>16</FundId>
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

  def self.add_batch
    data = <<-xml
    <Batch>
      <BatchDate>2013-04-08T00:00:00</BatchDate>
      <BatchDateEnd>1900-01-01T00:00:00</BatchDateEnd>
      <BatchName>New Batch</BatchName>
      <BatchTypeName>Unknown</BatchTypeName>
      <Finalized>True</Finalized>
    </Batch>
    xml

    post_with_signature("/batch/add", {body: data})
  end

  def self.update_batch(batch_id)
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