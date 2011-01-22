<?xml version="1.0"?>
<!--

Szablon transformujący dane terytorialne GUS do formatu CSV - plik konfiguracyjny.

@author: Jacek Krysztofik <jacek.krysztofik@gmail.com>
@version: 1.0
@license: GPL v3.0

-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="csv-separator" select="';'" />
	<xsl:variable name="csv-newline" select="'&#10;'" />
	<xsl:variable name="csv-header" select="'yes'" />
</xsl:stylesheet>
