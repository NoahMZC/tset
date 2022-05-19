include: "noah_0513.model"


explore: copy_bigquerytable {}

include: "redshift.model"
include: "noah_0513.model"
include: "/views/*.view.lkml"

explore: copy_redshifttable {}

explore: bm_d_passenger_type_cd {}

explore: combine {}
