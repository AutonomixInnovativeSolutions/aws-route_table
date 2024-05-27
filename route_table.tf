
resource "aws_route_table" "rt" {

  vpc_id = var.vpc_id
 
   tags = {
    Name = var.route_table_name
  }

}

resource "aws_route_table_association" "a" {
for_each = toset([for subnet in var.subnet_id: subnet] )
  subnet_id      = each.value
  route_table_id = aws_route_table.rt.id
}
