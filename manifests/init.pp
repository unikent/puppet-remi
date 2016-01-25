# Add remi repo
# enabled   - Integer for enabling remi repo (defaults to enabled)
# extras    - Integer for enabling/disabling remi-extras repo (defaults to disabled)
# php55     - Integer for enabling/disabling remi-php55 repo (defaults to disabled)
# php56     - Integer for enabling/disabling remi-php56 repo (defaults to disabled)
# php70     - Integer for enabling/disabling remi-php70 repo (defaults to disabled)
class remi(
    $enabled    = 1,
    $extras     = 0,
    $php55      = 0,
    $php56      = 0,
    $php70      = 0
) {
    yumrepo {
        'remi':
            baseurl     => 'http://rpms.famillecollet.com/enterprise/$releasever/remi/$basearch/',
            mirrorlist  => 'http://rpms.famillecollet.com/enterprise/$releasever/remi/mirror',
            enabled     => $enabled,
            gpgcheck    => 1,
            gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
            descr       => 'Les RPM de remi pour Enterprise Linux $releasever - $basearch';

        'remi-php55':
            baseurl     => 'http://rpms.famillecollet.com/enterprise/$releasever/php55/$basearch/',
            mirrorlist  => 'http://rpms.famillecollet.com/enterprise/$releasever/php55/mirror',
            enabled     => $php55,
            gpgcheck    => 1,
            gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
            descr       => 'Les RPM de remi de PHP 5.5 pour Enterprise Linux $releasever - $basearch';

        'remi-php56':
            baseurl     => 'http://rpms.famillecollet.com/enterprise/$releasever/php56/$basearch/',
            mirrorlist  => 'http://rpms.famillecollet.com/enterprise/$releasever/php56/mirror',
            enabled     => $php56,
            gpgcheck    => 1,
            gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
            descr       => 'Les RPM de remi de PHP 5.6 pour Enterprise Linux $releasever - $basearch';

        'remi-php70':
            baseurl     => 'http://rpms.famillecollet.com/enterprise/$releasever/php70/$basearch/',
            mirrorlist  => 'http://rpms.famillecollet.com/enterprise/$releasever/php70/mirror',
            enabled     => $php70,
            gpgcheck    => 1,
            gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
            descr       => 'Les RPM de remi de PHP 7.0 pour Enterprise Linux $releasever - $basearch';

        'remi-extras':
            baseurl     => 'http://rpms.famillecollet.com/enterprise/$releasever/safe/$basearch/',
            mirrorlist  => 'http://rpms.famillecollet.com/enterprise/$releasever/safe/mirror',
            enabled     => $extras,
            gpgcheck    => 1,
            gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
            descr       => 'Les RPM de remi en safe pour Enterprise Linux $releasever - $basearch';
    }

    file {
        '/etc/pki/rpm-gpg/RPM-GPG-KEY-remi':
            ensure => present,
            owner  => 'root',
            group  => 'root',
            mode   => '0644',
            source => 'puppet:///modules/remi/RPM-GPG-KEY-remi';
    }

    epel::rpm_gpg_key{
        'remi':
            path => '/etc/pki/rpm-gpg/RPM-GPG-KEY-remi';
    }
}
