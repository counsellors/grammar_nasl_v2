#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Gentoo Linux Security Advisory GLSA 201412-33.
#
# The advisory text is Copyright (C) 2001-2015 Gentoo Foundation, Inc.
# and licensed under the Creative Commons - Attribution / Share Alike 
# license. See http://creativecommons.org/licenses/by-sa/3.0/
#

include("compat.inc");

if (description)
{
  script_id(80210);
  script_version("$Revision: 1.3 $");
  script_cvs_date("$Date: 2015/04/13 14:33:56 $");

  script_cve_id("CVE-2009-4009", "CVE-2009-4010", "CVE-2012-1193", "CVE-2014-8601");
  script_bugtraq_id(37650, 37653, 59348, 71545);
  script_xref(name:"GLSA", value:"201412-33");

  script_name(english:"GLSA-201412-33 : PowerDNS Recursor: Multiple vulnerabilities");
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
"The remote host is affected by the vulnerability described in GLSA-201412-33
(PowerDNS Recursor: Multiple vulnerabilities)

    Multiple vulnerabilities have been discovered in PowerDNS Recursor.
      Please review the CVE identifiers and PowerDNS blog post referenced below
      for details.
  
Impact :

    A remote attacker may be able to send specially crafted packets,
      possibly resulting in arbitrary code execution or a Denial of Service
      condition. Furthermore, a remote attacker may be able to spoof DNS data.
  
Workaround :

    There is no known workaround at this time."
  );
  # http://blog.powerdns.com/2014/02/06/related-to-recent-dos-attacks-recursor-configuration-file-guidance/
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?a05443a5"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://security.gentoo.org/glsa/201412-33"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"All PowerDNS Recursor users should upgrade to the latest version:
      # emerge --sync
      # emerge --ask --oneshot --verbose '>=net-dns/pdns-recursor-3.6.1-r1'"
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");
  script_cwe_id(119);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:gentoo:linux:pdns-recursor");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:gentoo:linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2014/12/22");
  script_set_attribute(attribute:"plugin_publication_date", value:"2014/12/23");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2014-2015 Tenable Network Security, Inc.");
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

if (qpkg_check(package:"net-dns/pdns-recursor", unaffected:make_list("ge 3.6.1-r1"), vulnerable:make_list("lt 3.6.1-r1"))) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "PowerDNS Recursor");
}