#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if (description)
{
  script_id(89832);
  script_version("$Revision: 1.5 $");
  script_cvs_date("$Date: 2016/05/15 04:41:37 $");

  script_cve_id(
    "CVE-2016-1007",
    "CVE-2016-1008",
    "CVE-2016-1009"
  );
  script_bugtraq_id(
    84215,
    84216
  );
  script_osvdb_id(
    135504,
    135505,
    135506
  );

  script_name(english:"Adobe Acrobat < 11.0.15 / 15.006.30121 / 15.010.20060 Multiple Vulnerabilities (APSB16-09) (Mac OS X)");
  script_summary(english:"Checks the version of Adobe Acrobat.");

  script_set_attribute(attribute:"synopsis", value:
"The version of Adobe Acrobat installed on the remote Mac OS X host is
affected by multiple vulnerabilities.");
  script_set_attribute(attribute:"description", value:
"The version of Adobe Acrobat installed on the remote Mac OS X host is
prior to 11.0.15, 15.006.30121, or 15.010.20060. It is, therefore,
affected by multiple vulnerabilities :

  - A memory corruption issue exists due to the use of
    uninitialized memory when handling annotation gestures.
    A remote attacker can exploit this, via a crafted PDF
    file, to corrupt memory, resulting in a denial of
    service or the execution of arbitrary code.
    (CVE-2016-1007)

  - A flaw exists related to searching and loading
    dynamic-link library (DLL) files due to using a search
    path that may contain directories which are not trusted
    or under the user's control. An attacker can exploit
    this, by injecting a malicious DLL into the path, to
    gain elevated privileges. (CVE-2016-1008)

  - An array indexing error exists due to improper
    validation of user-supplied input. A remote attacker can
    exploit this, via a crafted PDF file, to corrupt memory,
    resulting in a denial of service or the execution of
    arbitrary code. (CVE-2016-1009)

Note that Nessus has not tested for these issues but has instead
relied only on the application's self-reported version number.");
  script_set_attribute(attribute:"see_also", value:"https://helpx.adobe.com/security/products/reader/apsb16-09.html");
  script_set_attribute(attribute:"solution", value:
"Upgrade to Adobe Acrobat version 11.0.15 / 15.006.30121 / 15.010.20060
or later.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:F/RL:OF/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"vuln_publication_date", value:"2016/03/08");
  script_set_attribute(attribute:"patch_publication_date", value:"2016/03/08");
  script_set_attribute(attribute:"plugin_publication_date", value:"2016/03/10");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"cpe:/a:adobe:acrobat");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_family(english:"MacOS X Local Security Checks");

  script_copyright(english:"This script is Copyright (C) 2016 Tenable Network Security, Inc.");

  script_dependencies("macosx_adobe_acrobat_installed.nbin");
  script_require_keys("Host/local_checks_enabled", "Host/MacOSX/Version", "installed_sw/Adobe Acrobat");

  exit(0);
}

include("audit.inc");
include("global_settings.inc");
include("misc_func.inc");
include("install_func.inc");

get_kb_item_or_exit("Host/local_checks_enabled");
os = get_kb_item("Host/MacOSX/Version");
if (empty_or_null(os)) audit(AUDIT_OS_NOT, "Mac OS X");

app_name = "Adobe Acrobat";
install = get_single_install(app_name:app_name);

version = install['version'];
path    = install['path'];

ver = split(version, sep:'.', keep:FALSE);
for (i=0; i<max_index(ver); i++)
  ver[i] = int(ver[i]);

# Affected is :
# 
# 11.x < 11.0.15
# DC Classic < 15.006.30121
# DC Continuous < 15.010.20060
if (
  (ver[0] == 11 && ver[1] == 0 && ver[2] <= 14) ||
  (ver[0] == 15 && ver[1] == 6 && ver[2] <= 30119) ||
  (ver[0] == 15 && ver[1] == 7 ) ||
  (ver[0] == 15 && ver[1] == 8 ) ||
  (ver[0] == 15 && ver[1] == 9 ) ||
  (ver[0] == 15 && ver[1] == 10 && ver[2] <= 20059)
)
{
  report = '\n  Path              : '+path+
           '\n  Installed version : '+version+
           '\n  Fixed version     : 11.0.15 / 15.006.30121 / 15.010.20060' +
           '\n';
  security_report_v4(port:0, extra:report, severity:SECURITY_HOLE);
}
else audit(AUDIT_INST_PATH_NOT_VULN, app_name, version, path);