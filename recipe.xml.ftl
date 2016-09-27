<?xml version="1.0"?>
<recipe>
    <#include "../common/recipe_manifest.xml.ftl" />

<#if generateLayout>
    <#if appCompat && !(hasDependency('com.android.support:appcompat-v7'))>
		<dependency mavenUrl="com.android.support:appcompat-v7:${buildApi}.+"/>
	</#if>

    <instantiate from="root/res/values/no_actionbar_styles.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/no_actionbar_styles.xml" />

    <instantiate from="root/res/layout/activity_simple.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <instantiate from="root/src/app_package/SimpleActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
</#if>

</recipe>
