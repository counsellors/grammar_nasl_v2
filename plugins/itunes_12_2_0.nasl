#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if (description)
{
  script_id(84504);
  script_version("$Revision: 1.5 $");
  script_cvs_date("$Date: 2016/05/16 14:02:52 $");

  script_cve_id(
    "CVE-2014-3192",
    "CVE-2014-4452",
    "CVE-2014-4459",
    "CVE-2014-4466",
    "CVE-2014-4468",
    "CVE-2014-4469",
    "CVE-2014-4470",
    "CVE-2014-4471",
    "CVE-2014-4472",
    "CVE-2014-4473",
    "CVE-2014-4474",
    "CVE-2014-4475",
    "CVE-2014-4476",
    "CVE-2014-4477",
    "CVE-2014-4479",
    "CVE-2015-1068",
    "CVE-2015-1069",
    "CVE-2015-1070",
    "CVE-2015-1071",
    "CVE-2015-1072",
    "CVE-2015-1073",
    "CVE-2015-1074",
    "CVE-2015-1075",
    "CVE-2015-1076",
    "CVE-2015-1077",
    "CVE-2015-1078",
    "CVE-2015-1079",
    "CVE-2015-1080",
    "CVE-2015-1081",
    "CVE-2015-1082",
    "CVE-2015-1083",
    "CVE-2015-1119",
    "CVE-2015-1120",
    "CVE-2015-1121",
    "CVE-2015-1122",
    "CVE-2015-1124",
    "CVE-2015-1152",
    "CVE-2015-1153",
    "CVE-2015-1154"
  );
  script_bugtraq_id(
    70273,
    71137,
    71144,
    71438,
    71442,
    71444,
    71445,
    71449,
    71451,
    71459,
    71461,
    71462,
    72329,
    72330,
    72331,
    73972,
    74523,
    74525,
    74526
  );
  script_osvdb_id(
    112753,
    114733,
    114735,
    115345,
    115346,
    115347,
    115348,
    115349,
    115350,
    115351,
    115352,
    115353,
    117622,
    117623,
    117624,
    119675,
    119676,
    119677,
    119678,
    119679,
    119680,
    119681,
    119682,
    119683,
    119684,
    119685,
    119686,
    119687,
    119688,
    119689,
    119690,
    120402,
    120403,
    120404,
    120405,
    120406,
    121738,
    121739,
    121740
  );
  script_xref(name:"APPLE-SA", value:"APPLE-SA-2015-06-30-6");

  script_name(english:"Apple iTunes < 12.2 Multiple Vulnerabilities (credentialed check)");
  script_summary(english:"Checks the version of iTunes on Windows.");

  script_set_attribute(attribute:"synopsis", value:
"The remote host contains an application that is affected by multiple
vulnerabilities.");
  script_set_attribute(attribute:"description", value:
"The version of Apple iTunes installed on the remote Windows host is
prior to 12.2. It is, therefore, affected by multiple vulnerabilities
in the bundled version of WebKit, including denial of service and
arbitrary code execution vulnerabilities.

Note that Nessus has not tested for these issues but has instead
relied only on the application's self-reported version number.");
  script_set_attribute(attribute:"see_also", value:"https://support.apple.com/kb/HT204949");
  # http://lists.apple.com/archives/security-announce/2015/Jun/msg00006.html
  script_set_attribute(attribute:"see_also", value:"http://www.nessus.org/u?fe3244d5");
  script_set_attribute(attribute:"solution", value:"Upgrade to Apple iTunes 12.2 or later.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:F/RL:ND/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"vuln_publication_date", value:"2014/09/19");
  script_set_attribute(attribute:"patch_publication_date", value:"2015/06/30");
  script_set_attribute(attribute:"plugin_publication_date", value:"2015/07/03");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"cpe:/a:apple:itunes");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_family(english:"Windows");

  script_copyright(english:"This script is Copyright (C) 2015-2016 Tenable Network Security, Inc.");

  script_dependencies("itunes_detect.nasl");
  script_require_keys("installed_sw/iTunes Version", "SMB/Registry/Enumerated");

  exit(0);
}

include("audit.inc");
include("global_settings.inc");
include("misc_func.inc");
include("install_func.inc");

# Ensure this is Windows
get_kb_item_or_exit("SMB/Registry/Enumerated");

app_id = 'iTunes Version';
install = get_single_install(app_name:app_id, exit_if_unknown_ver:TRUE);

version = install["version"];
path = install["path"];

fixed_version = "12.2.0.145";
if (ver_compare(ver:version, fix:fixed_version) < 0)
{
  port = get_kb_item("SMB/transport");
  if (!port) port = 445;

  if (report_verbosity > 0)
  {
    report =
      '\n  Path              : ' + path +
      '\n  Installed version : ' + version +
      '\n  Fixed version     : ' + fixed_version +
      '\n';
    security_hole(port:port, extra:report);
  }
  else security_hole(port);
}
else audit(AUDIT_INST_PATH_NOT_VULN, "iTunes", version, path);