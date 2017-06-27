#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Gentoo Linux Security Advisory GLSA 200711-12.
#
# The advisory text is Copyright (C) 2001-2015 Gentoo Foundation, Inc.
# and licensed under the Creative Commons - Attribution / Share Alike 
# license. See http://creativecommons.org/licenses/by-sa/3.0/
#

include("compat.inc");

if (description)
{
  script_id(27847);
  script_version("$Revision: 1.12 $");
  script_cvs_date("$Date: 2015/04/13 14:04:24 $");

  script_cve_id("CVE-2005-4790");
  script_osvdb_id(19982, 39577, 39578);
  script_xref(name:"GLSA", value:"200711-12");

  script_name(english:"GLSA-200711-12 : Tomboy: User-assisted execution of arbitrary code");
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
"The remote host is affected by the vulnerability described in GLSA-200711-12
(Tomboy: User-assisted execution of arbitrary code)

    Jan Oravec reported that the '/usr/bin/tomboy' script sets the
    'LD_LIBRARY_PATH' environment variable incorrectly, which might result
    in the current working directory (.) to be included when searching for
    dynamically linked libraries of the Mono Runtime application.
  
Impact :

    A local attacker could entice a user into running Tomboy in a directory
    containing a specially crafted library file to execute arbitrary code
    with the privileges of the user running Tomboy.
  
Workaround :

    Do not run Tomboy from an untrusted working directory."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://security.gentoo.org/glsa/200711-12"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"All Tomboy users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose '>=app-misc/tomboy-0.8.1-r1'"
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:M/Au:N/C:C/I:C/A:C");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:gentoo:linux:tomboy");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:gentoo:linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2007/11/08");
  script_set_attribute(attribute:"plugin_publication_date", value:"2007/11/09");
  script_set_attribute(attribute:"vuln_publication_date", value:"2005/10/08");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2007-2015 Tenable Network Security, Inc.");
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

if (qpkg_check(package:"app-misc/tomboy", unaffected:make_list("ge 0.8.1-r1"), vulnerable:make_list("lt 0.8.1-r1"))) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "Tomboy");
}