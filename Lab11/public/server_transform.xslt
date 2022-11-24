<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
    <p><strong>Ответ: </strong><xsl:value-of select="output/result"/></p>    

        <table class="simons-table">
            <thead>
                <tr>
                    <th>Факториал</th>
                    <th>Последовательность</th>
                </tr>
            </thead>

            <xsl:for-each select="output/simons/simon">
                <tbody>
                    <tr>
                        <th>
                            <xsl:value-of select="f"></xsl:value-of>
                        </th>
                        <th>
                            <xsl:value-of select="a1"></xsl:value-of>
                            *
                            <xsl:value-of select="a2"></xsl:value-of>
                            *
                            <xsl:value-of select="a3"></xsl:value-of>
                        </th>
                    </tr>
                </tbody>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>