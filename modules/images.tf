resource "lxd_cached_image" "jammy" {
  source_remote = "ubuntu"
  source_image  = "jammy/amd64"
}
