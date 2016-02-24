
task :default => :cql

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
