package ${packageName};

import ${superClassFqcn};
import android.os.Bundle;
<#if includeCppSupport!false>
import android.widget.TextView;
</#if>

public class ${activityClass} extends ${superClass} {

	private TextView tv;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});
	    tv = (TextView) findViewById(R.id.sample_text);
		tv.setText("Button");
    }
<#include "../../../../common/jni_code_snippet.java.ftl">
}
