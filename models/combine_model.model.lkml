include: "noah_0513.model"


explore: copy_bigquerytable {}

include: "redshift.model"

include: "/views/*.view.lkml"

explore: copy_redshifttable {}



explore: combine {}
