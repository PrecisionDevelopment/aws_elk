normal[:elasticsearch][:version] = '1.6.0'
normal[:elasticsearch][:download_url] = 'https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.6.0.tar.gz'
normal[:elasticsearch][:checksum] = 'dc336c83394b2f2f72f362e0f959a4cfdec2109aa3de15668401afeab0b02d2e'

default[:elasticsearch][:http_auth] = false
#default[:elasticsearch][:http_auth_plugin] = 'https://github.com/Asquera/elasticsearch-http-basic/releases/download/1.3.2/elasticsearch-http-basic-1.3.2.jar'
default[:elasticsearch][:http_auth_plugin] = 'https://github.com/Asquera/elasticsearch-http-basic/releases/download/v1.3.0-security-fix/elasticsearch-http-basic-1.3.0.jar'

if node[:elasticsearch][:http_auth] == true
  normal[:elasticsearch][:custom_config] = {}
  normal[:elasticsearch][:custom_config]["http.basic.enabled"] = true
  normal[:elasticsearch][:custom_config]["http.basic.user"] = node[:elasticsearch][:basic_auth][:user]
  normal[:elasticsearch][:custom_config]["http.basic.password"] = node[:elasticsearch][:basic_auth][:password]

  # TODO we need to add all ips from our opsworks stack, or better when we move to vpc the subnet
  normal[:elasticsearch][:custom_config]["http.basic.ipwhitelist"] = ["localhost", "127.0.0.1"]
end

normal[:elasticsearch][:custom_config]["indices.fielddata.cache.size"] = "40%"

normal[:java][:install_flavor] = 'openjdk'
normal[:java][:jdk_version] = '7'
