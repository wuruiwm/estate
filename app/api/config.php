<?php
/**
 * Created by iActing.
 * User: 758246061@qq.com
 * Date: 2018/10/23 0023
 * Time: 15:26
 */

return [
    // 默认输出类型
    'default_return_type'    => 'json',
    // 数据集返回类型
    'resultset_type'  => 'collecton',

    //md5 密码盐 token盐
    'md5'=>[
        'password_salt' => 't$lErGine^rtFeg',
        'token_salt' => 'fkGrL4*f#fPyi!'
    ],

    // 缓存
    'cache' => [
        'token_expire'=>7200 //2小时
    ],

    // 支付宝配置
    'alipay'=>[
        'callback_url'=>'http://nansheng.ah400tel.com/api/v1/alipay/login_callback',//回调url
        'appid'=>'2018110161926618',//支付宝APPID
        //'rsa_private_key'=>'MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCz5ZPM6/A0qhG1MR2W5lEGpn6Wht8zbIYZWWNERlMrtN0VYXK2YMG6i1hwfUI9iz5kmK7EJsHQ7+58GKwoWaLfyZKjQOl78W6hsSCCfH3Vx43TprDfS+9/PEzdMAtGMJhTmBu0HuxldGhlURl9kQ8Hi+u3S+nryvtsChSwtp9NfqHeD3S1Wq+qwM5EBEgBW6UZT9D8zWCRnfa/nImgYa9OtMOZIw6nnPKyOnN5SH9mBClc0kAA18LyEpf/UL8LyAFWjOHL57mwX10UPo4mhESTRZGlklIS8fXT1WbO/xnAodTGSCC6fpgqv2OlLWfIbM/y1LyDGadxuR0Mk4XOwS03AgMBAAECggEBAIGpQvI8TBFpUwIJuI3+yv/EGRFdfJqP6cdzify3w1KJNaAncIrLClbuAHxzi77YEcxnz+9JEAEMLhP7pHogwSgTHUHVk3Pl/BtGk2v5Vqky/6JBTtJi5OgMCkqSSk340JHP3Ifikfg+AtCjt3+tgeuqiea/LIbq8nRYf7kup3suSQLJHszImgmr4xIP/yd0DlJ4ZkjBkH2DQ4TJw4IJbE99/YwEK2DLWC2SNHSDBLBcx9jfQMETmdAtH3RjCW44oQAEDua1CcC0yursW/z65vieRxpzy4taFVevjQ4/lNV7IWgbJr/tEDB3JlKdsgXfSnPYU30VtSnnGF5sRlLBhAECgYEA2+WR2u0R1NQY6OA79ClNGV8mvu7O8EU5cwMAuxW/FlH4XwwcspDDYXy8o8vKq1tKQu8Ss+mG5XrNjecuqI225UNcl2Ejoa5OoSypXPg0BcH1g4nMe8z/CqLthU8IGObogOUsEWZayl0loWB9itTlkRUma99LZMdllSJbjMyTKYECgYEA0W7HKyWzMZVDbzXZ4WKWAR+k1AxY38YNlCWiKC7HX4NNhh6sLlIrOXMs2mpbPqjXHxZH5TsVUhM6zyoMNFvCrncvbe7UvYNXaFYEMPqCFZD26kUprUMqTZ97fCTIOfIRpsKKQd2wsOtTRG/6hRziL0Me5Po1kUBngY4Pc6X7grcCgYA/w6Yz0aLmEErY3I0GFCPjQ5A8tYsUaT5rd2dy2K98jXB0P1LjBM9jKYSaCrJOVj6GgkTuHr2bNaz9hRgmkFGE0a+7xdNLQvxSCF1kNCUBtmi3J/I/xAYA05YEnhI/BlZNaicJNKEHJVOQJCbDZ1DabUOi7DE0nA183WWmwnu6AQKBgQC5T+ERr6EYPW/WxnqMsJP0WJCbRHWbQ36eWJJcJdAqFl+RTjCiJ/ixM9U7SiKElhcLHcbt8VKTNgqyZg04gv0HLNSd3FcHfWDpJDs/L1nNRWEFt78B3U1gM76rAUzd4PB3cumtEEEYupEKHF86S21jzmtWxoKBjNBJVW8csICUjwKBgQDW+EutFPLvBL0aGuw+LivP5a8M2t4aL+U+knFoqbuHEttgot/jKGX5C5HjNt8qWnHpMaSp1Wm71VUR1sbg/VSgvy8Uajvfmr4w+kp880tKyx3clUS4GfJzVUgl6YJ6/4vBvmGBQ6fcielAvrlRtNSwZd10L0xf3Oq46CsVcT2qxQ==',//应用私钥
        //'rsa_private_key'=>'MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAMKjHJUBzelPqZHzXMmy9evQE2i2u+1b0GGM4zSGLYAcaohI42Ue4V+9N4kUt753MA+Ddb2MsWjZPNkvFOHaVZez0D8wtHgHJ7brSt19sF6cBR0oKRZ8OEYRMEqGJ5Id4xSZkUhdFuxRsELZXHxbPuRJJA7+swvd1buHeixKz03XAgMBAAECgYEAjFd+aXbGmV9GfqWClzECH4mGJS/1q31TcLNctGe3cTOMIT6lMCmnChhubdpRbvWT4uvAPu+ukFJrjJJlNUDwC1NjJ5nVKpQj7kOQgcFbeJIFkLkRrwskLp3Se2T4LDYb3pUgH7lAeCe0FHy3p+33GWuMYhu9MrIRak3vWuegvkkCQQDqYCwK3q9AfeMgS7MEolqiBQABFGosaalYpr0Z2RNrnkKbIRc1P4BKeqcy/NCKJLjGtia5PRzWcmtLeBNXa24jAkEA1JhWS/bRRNUOXQZBbVzcannh7RA9tI8YI/FF6ojmKuBW+EZaqAspWYPS2VsywuMDXkvVaD/qD0UJ886E5JHqvQJBAKkS2ZK507j1V1xb33dvW2xXqQoeXP1O99Aw8GduFjljQG9CLsjF11ljI6x/fjy5guYuTr8AXAZDIi2eIG3G3PsCQQCA1aDWgEjp0cPWlAfqYrAgxqQnqgP6/AzBG2Inc7conLOX2eruk3UHjl+k4SOt/yz3ZDV769/ISSpy2eCnM9ZxAkBl7l1sxiGWF2j5WXqYLBunnlo7sRFHuhL13kz4zoumlMrYCoUzTT7YyOylyS7/Mt6gxvXgdu526I9aHjwRpFzC',//应用私钥
        'rsa_private_ley'=>'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCpOdi0nsrJXrS6YV4/2sk4pHAfrZ1n1rYCxhBMqwcI3O3S7fr0ZuaBAzvPnXjcwxXHRufZI2cwUz3yI7NF6jiwztcvZCHSKsjXDVnzVCX94FYnnAlbPubNCEzBZIi3pP5P4+7RSfDKIsP8S5JDp21iXR15ogVIsSTqMm1I+8/gJ3+cjdXywPSyjwTnKKPqbS9S/JYyLXSFrbJMeLTl5TilJ8Q58qQ4Xy8WHM8cPLg4ToaVvS3c8fUjsZZIH8WIZ4kJe54w7+jcJjGpN/SyuebwMbSXrQ+7dAA7LDHEfQng/OIW6sDrmCOo6Vdr4t7PbChJlI2xP9D/LLdbfRL0bvcRAgMBAAECggEAHXJfby6igt/j+vqud9YOZbjXeeuwFD2cdmcYtv6bvsMS7z1SCe1N9u0lHz97pI6d34tLFNHARvx1LwlfTK8xJjMX5rs512RyhllgaaMe6Up8M3BHgIU1jEABezWPRMWFK0myaODA8auTBvfvf65GrnMdiejTmo6YqdgUhDqtNYfhXAryPJ4SDSoJmZFNhpD2QoLCWehIZc0KzhF39HbF/t3g1HNrTiHCsQPgvQDx8aBq/MIWLwM/oYMbK0LzveW0TmuIeZGYD458ZkB4/KhsDRFxPzvZhcAoiHxaCsylMoBCwOUdDAKML48Ij/9lf9sZVyDZDj51aD1d9zsTFrMucQKBgQDgdqq99T7iVZJrBEQQJ7fWVXlyM8eZvgCOjKEMMkB+Sbj3HZ3C7y9zZ0iRd/RfgeblJfy0tpwEkgCC2NJN/3JFjSttxF4D9n3kyoQ3i3T16ufbgNkcn6GHxr8nRQjCqLm85P0DHAoqC+CvoosDAx9DF1kJKwtO/QQBwK+H2+xtowKBgQDBAG+/jcxzRGGlY4BMd8PgJAK3mTtUrBPZa7M/VMLA4A9bplaAdENhG/WxuW+cFuEbWV6IY8/RwMWIj8KUVukuj59SV1URUZ8NdZ/pZV/dDZsPCiR6HxtUyuB1R+bardvD7FeQWapYYzmAB6kWcx9X5tjUutWxt7+DIKk3AnWruwKBgCJbJ3Ehy3k7HckRgxVx7tp4hLktIbzvbwhij/fc7TAnOo9gUhhXIc0pHttdH+NKb7vdH5vNY33zlu5wH2he0++/VslbSASVQtm1AZ2607EcPlbDlvehm0i76+An2dppltxJtEw4i3m6Da70UxCn9q3/MdqMYxO4+FcIVhWWXM6/AoGAfXu9LDwTe7YwDooc9pq/vdFr+tcj3i9rUGdXyYtgfGqxUZNalnYBAPhezEiWqlOt1ExMzDyo9+VwCRP/HNdNELrMiYrCglohIW0ipWsF4wFfmW2svcHP0Vd+jIJNNEzpn/7gB7hkqscIsZdJdpEvBcXPoLBBFCU13Rm1K1DsFNUCgYEApmDErURzKnyOd7beaexh134mZUauISxDXE49X9O7t8RK5oFYGBhCpd/mfQdwkc8GputDFX5wpftexE9ykf97t8tw6PPEgts/dM+O+r0JTOz6KehIir6jvrObBh8e64Q30OZX9PvQaak8NFL0NuYtOU6S3A/YFq4fwWGHIwv/6/c=',


        'alipay_rsa_public_key'=>'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnw6QTm0XmEUlAdqS8zt/15XIBB5dKswyuo6rZ+IsZlBgWizF6B6zNIk7K5rZA4H4PXamaZdpbweXE+/Sxt99piPT7lIqu9saxgds6YVA8sb2uBU1svB2BkueGgvwBFAppO88Q57xk1DdTN7Mr0+S+8E0f/pJporYLmOVJPqL2teUlrILNUY2wEGiJ9nAaVkiFXxPWzzmrg2FB1O4b13rDBpvpdg0hO53Xe6EoxjPuQj1HlUhpEcghDZVmIEqbZ0oHnHH1wC6dkPgvST8UChB+SL56WLIbEhv3CMlwm6EeSMzHsurFkM7ZaAxZ+1dQXVsu1+jCgoWjVYrKM1lN2i7+wIDAQAB'//支付公钥
    ]
];
