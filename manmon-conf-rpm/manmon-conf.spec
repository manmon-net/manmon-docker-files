Summary: Manmon monitoring agent
Name: %{name}
Version: %{version}
Release: %{release}
Source0: .manmon_key
Source1: .manmon_crt
Source2: .manmon_ca
Source3: .constants
License: Commercial
Group: Development/Libraries
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-buildroot
Prefix: %{_prefix}
BuildArch: noarch
Vendor: Tomi Malkki <tomi@manmon.net>
Url: https://manmon.net/

%description
Manmon agent configuration

%install
mkdir -p %{buildroot}/var/lib/manmon/
install -p -m 400 %{SOURCE0} %{buildroot}/var/lib/manmon/
install -p -m 400 %{SOURCE1} %{buildroot}/var/lib/manmon/
install -p -m 400 %{SOURCE2} %{buildroot}/var/lib/manmon/
install -p -m 400 %{SOURCE3} %{buildroot}/var/lib/manmon/

%files
%defattr(-,mmagent,mmagent)
/var/lib/manmon/.constants
/var/lib/manmon/.manmon_key
/var/lib/manmon/.manmon_crt
/var/lib/manmon/.manmon_ca

