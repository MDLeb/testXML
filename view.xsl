<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'"/>
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
    
    <xsl:template match="/">
        <table>
            <th>
                <td>
                    Name
                </td>
                <td>
                    Price
                </td>
                <td>
                    Address
                </td>
            </th>
            <xsl:for-each select="Hotels/Hotel">
                <xsl:if test="(contains( translate(Address/State, $uppercase, $lowercase), 'ny') 
                                or contains(translate(Address/State, $uppercase, $lowercase), 'new york')) 
                                and (contains(translate(Name, $uppercase, $lowercase), 'hilton'))">
                    <tr>
                        <td>
                            <xsl:value-of select="Name"/>
                        </td>
                        <td>
                            <xsl:value-of select="@Price"/>
                        </td>
                        <td>
                            <xsl:value-of select="Address/AddressLine"/>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>