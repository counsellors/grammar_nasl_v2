#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Gentoo Linux Security Advisory GLSA 200410-18.
#
# The advisory text is Copyright (C) 2001-2017 Gentoo Foundation, Inc.
# and licensed under the Creative Commons - Attribution / Share Alike 
# license. See http://creativecommons.org/licenses/by-sa/3.0/
#

include("compat.inc");

if (description)
{
  script_id(15527);
  script_version("$Revision: 1.15 $");
  script_cvs_date("$Date: 2017/01/03 14:55:09 $");

  script_cve_id("CVE-2004-0967");
  script_osvdb_id(11069);
  script_xref(name:"GLSA", value:"200410-18");

  script_name(english:"GLSA-200410-18 : Ghostscript: Insecure temporary file use in multiple scripts");
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
"The remote host is affected by the vulnerability described in GLSA-200410-18
(Ghostscript: Insecure temporary file use in multiple scripts)

    The pj-gs.sh, ps2epsi, pv.sh and sysvlp.sh scripts create temporary files
    in world-writeable directories with predictable names.
  
Impact :

    A local attacker could create symbolic links in the temporary files
    directory, pointing to a valid file somewhere on the filesystem. When an
    affected script is called, this would result in the file to be overwritten
    with the rights of the user running the script, which could be the root
    user.
  
Workaround :

    There is no known workaround at this time."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://security.gentoo.org/glsa/200410-18"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"Ghostscript users on all architectures except PPC should upgrade to the
    latest version:
    # emerge sync
    # emerge -pv '>=app-text/ghostscript-esp-7.07.1-r7'
    # emerge '>=app-text/ghostscript-esp-7.07.1-r7'
    Ghostscript users on the PPC architecture should upgrade to the latest
    stable version on their architecture:
    # emerge sync
    # emerge -pv '>=app-text/ghostscript-esp-7.05.6-r2'
    # emerge '>=app-text/ghostscript-esp-7.05.6-r2'"
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:F/RL:ND/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:gentoo:linux:ghostscript-esp");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:gentoo:linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2004/10/20");
  script_set_attribute(attribute:"plugin_publication_date", value:"2004/10/21");
  script_set_attribute(attribute:"vuln_publication_date", value:"2004/09/30");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2004-2017 Tenable Network Security, Inc.");
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

if (qpkg_check(package:"app-text/ghostscript-esp", unaffected:make_list("ge 7.07.1-r7", "rge 7.05.6-r2"), vulnerable:make_list("lt 7.07.1-r7"))) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "Ghostscript");
}