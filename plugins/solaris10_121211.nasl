#
# (C) Tenable Network Security, Inc.
#
# The descriptive text in this plugin was
# extracted from the Oracle SunOS Patch Updates.
#
include("compat.inc");

if (description)
{
  script_id(25070);
  script_version("$Revision: 1.15 $");
  script_cvs_date("$Date: 2014/08/30 00:06:18 $");

  script_cve_id("CVE-2007-1681");

  script_name(english:"Solaris 10 (sparc) : 121211-02");
  script_summary(english:"Check for patch 121211-02");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote host is missing Sun Security Patch number 121211-02"
  );
  script_set_attribute(
    attribute:"description", 
    value:
"SunOS 5.10: Sun Java Web Console (Lockhart) Patch.
Date this patch was last updated by Sun : Apr/16/07"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://download.oracle.com/sunalerts/1001060.1.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"You should install this patch for your system to be up-to-date."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:sun:solaris");

  script_set_attribute(attribute:"patch_publication_date", value:"2007/04/16");
  script_set_attribute(attribute:"plugin_publication_date", value:"2007/04/19");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2007-2014 Tenable Network Security, Inc.");
  script_family(english:"Solaris Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/Solaris/showrev");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("solaris.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);

if (solaris_check_patch(release:"5.10", arch:"sparc", patch:"121211-02", obsoleted_by:"", package:"SUNWmctag", version:"2.2.2,REV=2005.01.09.23.05") < 0) flag++;
if (solaris_check_patch(release:"5.10", arch:"sparc", patch:"121211-02", obsoleted_by:"", package:"SUNWmcosx", version:"2.2.2,REV=2005.01.09.23.05") < 0) flag++;
if (solaris_check_patch(release:"5.10", arch:"sparc", patch:"121211-02", obsoleted_by:"", package:"SUNWmcos", version:"2.2.2,REV=2005.01.09.23.05") < 0) flag++;
if (solaris_check_patch(release:"5.10", arch:"sparc", patch:"121211-02", obsoleted_by:"", package:"SUNWmcon", version:"2.2.2,REV=2005.01.09.23.05") < 0) flag++;

if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:solaris_get_report());
  else security_hole(0);
  exit(0);
}
audit(AUDIT_HOST_NOT, "affected");