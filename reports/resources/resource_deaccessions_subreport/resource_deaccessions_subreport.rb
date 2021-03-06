class ResourceDeaccessionsSubreport < AbstractReport

  def template
    "resource_deaccessions_subreport.erb"
  end

  def accession_count
    query.count
  end

  def query
    db[:deaccession]
      .filter(:resource_id => @params.fetch(:resourceId))
      .select(Sequel.as(:id, :deaccessionId),
              Sequel.as(:description, :description),
              Sequel.as(:notification, :notification),
              Sequel.as(Sequel.lit("GetDeaccessionDate(id)"), :deaccessionDate),
              Sequel.as(Sequel.lit("GetDeaccessionExtent(id)"), :extentNumber),
              Sequel.as(Sequel.lit("GetDeaccessionExtentType(id)"), :extentType))
  end

end
