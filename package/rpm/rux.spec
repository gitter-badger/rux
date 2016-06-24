Name:		rux
Version:	0.1.0
Release:	1
Summary:	nCrux C Foundation Library
License:	MIT
URL:		http://www.ncrux.com/project/%{name}/
Group:		Development/Libraries
Source0:	%{name}-%{version}.tgz	
Packager:	Aditi <aditi@ncrux.com>

%define _rpmdir RPMS

%description
Highly Configurable C Foundation Library for Application Development.
This contains all fundamental ingredients like memory management,
data structures, sorting, searching etc.

%prep:

%build:
make

%install:

%files
%defattr(-,root,root)
/*

%changelog

