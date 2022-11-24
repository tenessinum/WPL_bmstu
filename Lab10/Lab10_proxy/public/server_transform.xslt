<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!--xsl:template говорит о том, что тут будет замена. match показывает, к какой части документа это применимо-->
    <xsl:template match="/">
        <!--Внутри шаблона пишем наше преобразование-->
        <table class="simons-table">
            <thead>
                <tr>
                    <th>Факториал</th>
                    <th>Последовательность</th>
                </tr>
            </thead>

            <!--Цикл-->
            <xsl:for-each select="objects/object">
                <!--Создание переменной-->
                <xsl:variable name="counter" select="position()" />
                <tbody>
                    <tr>
                        <th>
                            <!--Извлекаем значение из XML-тега-->
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