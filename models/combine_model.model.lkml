include: "noah_0513.model"
include: "redshift.model"
include: "/views/*.view.lkml"

explore: copy_redshifttable {}

explore: copy_bigquerytable {}
