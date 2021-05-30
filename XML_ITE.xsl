<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">
        <xsl:element name="centro">
            <xsl:attribute name="codcentro">
                <xsl:value-of select="name(ite)"/>
            </xsl:attribute>
            <xsl:element name="nombre">
                <xsl:attribute name="empresa">
                    <xsl:value-of select="ite/empresa"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="ite/@nombre"/>
            </xsl:element>
            <xsl:element name="web">
                <xsl:value-of select="ite/@web"/>
            </xsl:element>
            <xsl:element name="telf">
                <xsl:value-of select="ite/telefono"/>
            </xsl:element>
            <xsl:for-each select="ite/profesores/profesor">
                <xsl:element name="profesor">
                    <xsl:attribute name="id">
                        <xsl:value-of select="id"/>
                    </xsl:attribute>
                    <xsl:value-of select="nombre"/>                
                </xsl:element>
            </xsl:for-each>
            <xsl:element name="director">
                <xsl:attribute name="despacho">
                    <xsl:value-of select="ite/director/despacho"/>
                </xsl:attribute>
                <xsl:value-of select="ite/director/nombre"/>
            </xsl:element>
            <xsl:element name="jefe_estudios">
                <xsl:attribute name="despacho">
                    <xsl:value-of select="ite/jefe_estudios/despacho"/>
                </xsl:attribute>
                <xsl:value-of select="ite/jefe_estudios/nombre"/>
            </xsl:element>
            <xsl:for-each select="ite/ciclos/ciclo">
                <xsl:element name="ciclo">
                    <xsl:attribute name="nombre">
                        <xsl:value-of select="nombre"/>
                    </xsl:attribute>
                    <xsl:attribute name="grado">
                        <xsl:value-of select="grado"/>
                    </xsl:attribute>
                    <xsl:attribute name="anno_decreto">
                        <xsl:value-of select="decretoTitulo/@año"/>
                    </xsl:attribute>
                    <xsl:value-of select="@id"/>                
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>