resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
 public-ip = aws_instance.web.*.public_ip
 }
 )
 filename = "inventory"
}
