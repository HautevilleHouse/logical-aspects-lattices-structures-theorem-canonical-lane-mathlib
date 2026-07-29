import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean.LatticeStructure

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean

structure DistributiveLatticePackage extends LatticeStructurePackage where
  distrib : ∀ a b c : carrier, meet a (join b c) = join (meet a b) (meet a c)

def DistributiveLatticeClosed (D : DistributiveLatticePackage) : Prop :=
  LatticeStructureClosed D.toLatticeStructurePackage ∧ D.distrib

theorem distributive_lattice_closed_from_package (D : DistributiveLatticePackage) :
    DistributiveLatticeClosed D :=
  ⟨lattice_structure_closed_from_package D.toLatticeStructurePackage, D.distrib⟩

end LogicalAspectsLatticesStructuresTheoremCanonicalLaneLean
end HautevilleHouse
