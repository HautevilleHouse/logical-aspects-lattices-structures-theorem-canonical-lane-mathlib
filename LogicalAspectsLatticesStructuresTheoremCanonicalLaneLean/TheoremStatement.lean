import LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean.ReviewerBridge

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  latticeConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse