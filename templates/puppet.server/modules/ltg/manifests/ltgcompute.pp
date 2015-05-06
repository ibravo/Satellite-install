# LTG Compute node configuration using quickstack, and openstack modules.
class ltg::ltgcompute (

  $admin_password         = 'HIc3H0us32014__',
  $neutron_db_password    = 'HIc3H0us32014__',
  $neutron_user_password  = 'HIc3H0us32014__',
  $nova_db_password       = 'HIc3H0us32014__',
  $nova_user_password     = 'HIc3H0us32014__',
  $amqp_password          = 'HIc3H0us32014__',


  $ceilometer             = 'false',
  $cinder_backend_gluster = 'false',

  $amqp_host              = 'Hrabbitni101__',
  $auth_host              = 'Hkeystadmi100__',
  $mysql_host             = 'Hmysqlci100__',

 
) {
  }

