
一个 `Android Studio Project Template` 可以看成是一个 MVC 架构，选择的模版类型和输入的参数最终决定了输出工程和目录和文件内容。

![1](http://freemarker.org/images/overview.png)

[Apache FreeMarker](http://freemarker.org/docs/index.html)是一个 Java 模版引擎，利用模版和配置信息生成模版，可以将其看成是一个类似`SASS`的预处理器，模版中的文件通过 FreeMarker 预处理语言包装(在文件后加 ftl 后缀)，就拥有了一定的动态能力。例如将`MainActivity.java`包装成`MainActivity.java.ftl`。

ftl 预处理文件的好处可以用以下示例来说明
```
package ${packageName};

public class ${activityClass} extends ${superClass} {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
<#if generateLayout>
        setContentView(R.layout.${layoutName});
</#if>
<#include "../../../../common/jni_code_usage.java.ftl">
    }
<#include "../../../../common/jni_code_snippet.java.ftl">
}
```

1. `${activityClass}` 表示一个变量，这样就可以指定生成活动的名称。
2. `${activityToLayout(activityClass)}` 其中`activityToLayout`是一个内置函数，将类名转为布局文件名。
3. `FreeMarker`还可以使用 `if` 和 `include` 语法。

创建模版必须熟悉[模版的目录结构](http://freemarker.org/docs/dgui_quickstart_basics.html)，也可以参考已存在的模版。

1.template.xml 中 parameter 标签的类型 type 可以是 string, boolean, enum 以及 separator，将被渲染成不同的控件。

2.`globals.xml.ftl`文件中存放的是全局变量，大部分来源与`Comman`目录中的定义，也可以自定义。全局变量的另一个来源是`parameter` 标签。
3.`recipe.xml.ftl`文件决定了那些文件参与工程构建，是创建模版的核心。
```
<instantiate from="root/src/app_package/SimpleActivity.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />

<open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
```
`instantiate`表示使用`SimpleActivity.java`文件，`open`表示新建模版工程后将打开该活动。 