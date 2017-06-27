#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Gentoo Linux Security Advisory GLSA 201111-09.
#
# The advisory text is Copyright (C) 2001-2016 Gentoo Foundation, Inc.
# and licensed under the Creative Commons - Attribution / Share Alike 
# license. See http://creativecommons.org/licenses/by-sa/3.0/
#

include("compat.inc");

if (description)
{
  script_id(56905);
  script_version("$Revision: 1.7 $");
  script_cvs_date("$Date: 2016/05/16 13:53:25 $");

  script_cve_id("CVE-2010-1168");
  script_bugtraq_id(40302);
  script_osvdb_id(65683);
  script_xref(name:"GLSA", value:"201111-09");

  script_name(english:"GLSA-201111-09 : Perl Safe module: Arbitrary Perl code injection");
  script_summary(english:"Checks for updated package(s) in /var/db/pkg");

  script_set_attribute(
    attribute:"synopsis", 
    value:
"The remote Gentoo host is missing one or more security-related
patches."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"The remote host is affected by the vulnerability described in GLSA-201111-09
(Perl Safe module: Arbitrary Perl code injection)

    Unsafe code evaluation prevents the Safe module from properly
      restricting the code of implicitly called methods on implicitly blessed
      objects.
  
Impact :

    A remote attacker could entice a user to load a specially crafted Perl
      script, resulting in execution arbitrary Perl code outside of a
      restricted compartment.
  
Workaround :

    There is no known workaround at this time."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://security.gentoo.org/glsa/201111-09"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"All users of the standalone Perl Safe module should upgrade to the
      latest version:
      # emerge --sync
      # emerge --ask --oneshot --verbose '>=perl-core/Safe-2.27'
    All users of the Safe module bundled with Perl should upgrade to the
      latest version:
      # emerge --sync
      # emerge --ask --oneshot --verbose '>=virtual/perl-Safe-2.27'
    NOTE: This is a legacy GLSA. Updates for all affected architectures are
      available since July 18, 2010. It is likely that your system is already
      no longer affected by this issue."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:gentoo:linux:Safe");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:gentoo:linux:perl-Safe");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:gentoo:linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2011/11/20");
  script_set_attribute(attribute:"plugin_publication_date", value:"2011/11/22");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2011-2016 Tenable Network Security, Inc.");
  script_family(english:"Gentoo Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/Gentoo/release", "Host/Gentoo/qpkg-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("qpkg.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
if (!get_kb_item("Host/Gentoo/release")) audit(AUDIT_OS_NOT, "Gentoo");
if (!get_kb_item("Host/Gentoo/qpkg-list")) audit(AUDIT_PACKAGE_LIST_MISSING);


flag = 0;

if (qpkg_check(package:"virtual/perl-Safe", unaffected:make_list("ge 2.27"), vulnerable:make_list("lt 2.27"))) flag++;
if (qpkg_check(package:"perl-core/Safe", unaffected:make_list("ge 2.27"), vulnerable:make_list("lt 2.27"))) flag++;

if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:qpkg_report_get());
  else security_hole(0);
  exit(0);
}
else
{
  tested = qpkg_tests_get();
  if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "Perl Safe module");
}