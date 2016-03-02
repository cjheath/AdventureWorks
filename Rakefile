
task :default => [:sql, :datavault, :dvcomp, :cql]

desc "Generate new SQL from the CQL file"
task :sql do
  system <<-END
    schema_compositor --relational --sql/server CQL/AdventureWorks.cql >OLTP/AdventureWorks.sql
  END
end

desc "Generate new Datavault SQL from the CQL file"
task :datavault do
  system <<-END
    afgen --transform/datavault --sql/server CQL/AdventureWorks.cql >DataVault/AdventureWorks.dv.sql
  END
end

desc "Generate new Datavault SQL from the CQL file using the new schema_compositor"
task :dvcomp do
  system <<-END
    schema_compositor --datavault --sql/server CQL/AdventureWorks.cql >AdventureWorks.dv.sql
  END
end

desc "Generate new CQL from the ORM file (to verify version similarity)"
task :cql do
  system <<-END
    afgen --cql orm/AdventureWorks.orm >AdventureWorks.cql
    patch <orm/AdventureWorks.cql.diffs
    afgen --cql cql/AdventureWorks.cql 2>/tmp/AdventureWorks.errors >AdventureWorks.cql.cql || \
      (echo "CAL FAILED"; cat /tmp/AdventureWorks.errors; exit 1) && \
      (diff -b -U 1 AdventureWorks.cql AdventureWorks.cql.cql | tee AdventureWorks.cql.diffs)
  END
end
