# == Class: conda::params
#
# Internal class for setting up parameters
class conda::params {

    $install_dir = $::kernel ? {
        'windows'     => 'C:\Anaconda',
        /(L|l)inux/   => '/opt/anaconda',
        default       => 'FAIL'
    }

    $conda_exe =  $::kernel ? {
        'windows'     => "${install_dir}\\Scripts\\conda.exe",
        /(L|l)inux/   => "${install_dir}/bin/conda",
        default       => 'FAIL'
    }

    #$base_url = 'http://repo.continuum.io/miniconda'
    $base_url = 'http://local-package-server/Files'

    # Some versions of puppet report uppercase Linux
    $installer = $::kernel ? {
        /(L|l)inux/   => 'Miniconda-latest-Linux-x86_64.sh',
        'windows'     => 'Miniconda-latest-Windows-x86_64.exe',
        default       => 'FAIL'
    }
    $url = "${base_url}/${installer}"

    # Anaconda URLS
    #$anaconda_base_url = 'http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com'
    $anaconda_base_url = 'http://local-package-server/Files'

    $anaconda_installer = $::kernel ? {
        /(L|l)inux/ => 'Anaconda-2.1.0-Linux-x86_64.sh',
        'windows'   => 'Anaconda-2.1.0-Windows-x86_64.exe',
        default     => 'FAIL'
    }

    $anaconda_url = "${anaconda_base_url}/${anaconda_installer}"
}

