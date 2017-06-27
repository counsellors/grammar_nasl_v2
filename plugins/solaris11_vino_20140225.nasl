#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from the Oracle Third Party software advisories.
#
include("compat.inc");

if (description)
{
  script_id(80798);
  script_version("$Revision: 1.1 $");
  script_cvs_date("$Date: 2015/01/19 15:17:51 $");

  script_cve_id("CVE-2013-5745");

  script_name(english:"Oracle Solaris Third-Party Patch Update : vino (cve_2013_5745_input_validation)");
  script_summary(english:"Check for the 'entire' version.");

  script_set_attribute(
    attribute:"synopsis", 
    value:
"The remote Solaris system is missing a security patch for third-party
software."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"The remote Solaris system is missing necessary patches to address
security updates :

  - The vino_server_client_data_pending function in
    vino-server.c in GNOME Vino 2.26.1, 2.32.1, 3.7.3, and
    earlier, and 3.8 when encryption is disabled, does not
    properly clear client data when an error causes the
    connection to close during authentication, which allows
    remote attackers to cause a denial of service (infinite
    loop, CPU and disk consumption) via multiple crafted
    requests during authentication. (CVE-2013-5745)"
  );
  # http://www.oracle.com/technetwork/topics/security/thirdparty-patch-map-1482893.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?b5f8def1"
  );
  # https://blogs.oracle.com/sunsecurity/entry/cve_2013_5745_input_validation
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?a99d1102"
  );
  script_set_attribute(attribute:"solution", value:"Upgrade to Solaris 11.1.16.5.0.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:N/I:N/A:C");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:oracle:solaris:11.1");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:solaris:vino");

  script_set_attribute(attribute:"patch_publication_date", value:"2014/02/25");
  script_set_attribute(attribute:"plugin_publication_date", value:"2015/01/19");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2015 Tenable Network Security, Inc.");
  script_family(english:"Solaris Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/Solaris11/release", "Host/Solaris11/pkg-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("misc_func.inc");
include("solaris.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
release = get_kb_item("Host/Solaris11/release");
if (isnull(release)) audit(AUDIT_OS_NOT, "Solaris11");
pkg_list = solaris_pkg_list_leaves();
if (isnull (pkg_list)) audit(AUDIT_PACKAGE_LIST_MISSING, "Solaris pkg-list packages");

if (empty_or_null(egrep(string:pkg_list, pattern:"^vino$"))) audit(AUDIT_PACKAGE_NOT_INSTALLED, "vino");

flag = 0;

if (solaris_check_release(release:"0.5.11-0.175.1.16.0.5.0", sru:"SRU 11.1.16.5.0") > 0) flag++;

if (flag)
{
  error_extra = 'Affected package : vino\n' + solaris_get_report2();
  error_extra = ereg_replace(pattern:"version", replace:"OS version", string:error_extra);
  if (report_verbosity > 0) security_hole(port:0, extra:error_extra);
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_PACKAGE_NOT_AFFECTED, "vino");