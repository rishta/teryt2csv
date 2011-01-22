<?xml version="1.0"?>
<!--

Szablon transformujący dane terytorialne GUS do formatu CSV.

@author: Jacek Krysztofik <jacek.krysztofik@gmail.com>
@version: 1.0
@license: GPL v3.0

-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" standalone="yes" indent="no" />
	<xsl:include href="teryt.conf.xsl" />
	<xsl:strip-space elements="*" />

	<xsl:template match="col" mode="header">
		<xsl:value-of text-transform="lowercase" select="@name" />

		<xsl:if test="position() != last()">
			<xsl:value-of select="$csv-separator" />
		</xsl:if>
	</xsl:template>

	<xsl:template match="col">
		<xsl:value-of select="." />

		<xsl:if test="position() != last()">
			<xsl:value-of select="$csv-separator" />
		</xsl:if>
	</xsl:template>

	<xsl:template match="row">
		<xsl:apply-templates select="col" />

		<xsl:value-of select="$csv-newline" />
	</xsl:template>

	<xsl:template match="catalog">
		<xsl:if test="$csv-header = 'yes'">
			<xsl:apply-templates mode="header" select="row[1]" />
			<xsl:value-of select="$csv-newline" />
		</xsl:if>

		<xsl:apply-templates select="row" />
	</xsl:template>

	<xsl:template match="teryt">
		<xsl:apply-templates select="catalog" />
	</xsl:template>

	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>
</xsl:stylesheet>
