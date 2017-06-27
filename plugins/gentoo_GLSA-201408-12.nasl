#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Gentoo Linux Security Advisory GLSA 201408-12.
#
# The advisory text is Copyright (C) 2001-2016 Gentoo Foundation, Inc.
# and licensed under the Creative Commons - Attribution / Share Alike 
# license. See http://creativecommons.org/licenses/by-sa/3.0/
#

include("compat.inc");

if (description)
{
  script_id(77456);
  script_version("$Revision: 1.13 $");
  script_cvs_date("$Date: 2016/05/12 14:46:29 $");

  script_cve_id("CVE-2013-6438", "CVE-2014-0098", "CVE-2014-0226");
  script_bugtraq_id(66303, 68678);
  script_osvdb_id(104579, 104580, 109216);
  script_xref(name:"GLSA", value:"201408-12");

  script_name(english:"GLSA-201408-12 : Apache HTTP Server: Multiple vulnerabilities");
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
"The remote host is affected by the vulnerability described in GLSA-201408-12
(Apache HTTP Server: Multiple vulnerabilities)

    Multiple vulnerabilities have been found in Apache HTTP Server. Please
      review the CVE identifiers referenced below for details.
  
Impact :

    A remote attacker could send a specially crafted request to possibly
      execute arbitrary code, cause Denial of Service, or obtain sensitive
      information.
  
Workaround :

    There is no known workaround at this time."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://security.gentoo.org/glsa/201408-12"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"All Apache HTTP Server users should upgrade to the latest version:
      # emerge --sync
      # emerge --ask --oneshot --verbose '>=www-servers/apache-2.2.27-r4'"
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:U/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:gentoo:linux:apache");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:gentoo:linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2014/08/29");
  script_set_attribute(attribute:"plugin_publication_date", value:"2014/08/30");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2014-2016 Tenable Network Security, Inc.");
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

if (qpkg_check(package:"www-servers/apache", unaffected:make_list("ge 2.2.27-r4"), vulnerable:make_list("lt 2.2.27-r4"))) flag++;

if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:qpkg_report_get());
  else security_warning(0);
  exit(0);
}
else
{
  tested = qpkg_tests_get();
  if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "Apache HTTP Server");
}