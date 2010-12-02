module ApplicationHelper


  def photo_uploadify (has)
    # Putting the uploadify trigger script in the helper gives us
    # full access to the view and native rails objects without having
    # to set javascript variables.
    #
    # Uploadify is only a queue manager to hand carrierwave the files
    # one at a time. Carrierwave handles capturing, resizing and saving
    # all uploads. All limits set here (file types, size limit) are to
    # help the user pick the right files. Carrierwave is responsible
    # for enforcing the limits (white list file name, setting maximum file sizes)
    #
    # ScriptData:
    #   Sets the http headers to accept javascript plus adds
    #   the session key and authenticity token for XSS protection.
    #   The "FlashSessionCookieMiddleware" rack module deconstructs these
    #   parameters into something Rails will actually use.


    cs = controller_name.singularize
    if (has =="many")
      script_path = controller.send(cs+ "_photos_path", instance_variable_get("@#{cs}") )
      multi = "true"
    else
      script_path = "/" + controller_name + "/" + instance_variable_get("@#{cs}").id.to_s + "/photos"
      multi = "false"
    end

    session_key_name = Rails.application.config.session_options[:key]
    %Q{

    <script type='text/javascript'>
      $(document).ready(function() {


        $('#photo_upload').uploadify({
          script          : '#{script_path}',
          fileDataName    : 'photo[image]',
          uploader        : '/uploadify/uploadify.swf',
          cancelImg       : '/uploadify/cancel.png',
          buttonImg       : '/images/pic-upload.png',
          fileDesc        : 'Images',
          fileExt         : '*.png;*.jpg;*.gif',
          sizeLimit       : #{10.megabytes},
          queueSizeLimit  : 24,
          width           : 196,
          height          : 35,
          multi           : #{multi},
          auto            : true,
          buttonText      : 'Bilder hochladen',
          scriptData      : {
            '_http_accept': 'application/javascript',
            '#{session_key_name}' : encodeURIComponent('#{u(cookies[session_key_name])}'),
            'authenticity_token'  : encodeURIComponent('#{u(form_authenticity_token)}')
          },
          onComplete      : function(a, b, c, response){ eval(response) }
        });
      });
    </script>

    }.gsub(/[\n ]+/, ' ').strip.html_safe
  end

  def photo_sortable
    cs = controller_name.singularize
    script_path=controller.send("sort_" + cs+ "_photos_path", instance_variable_get("@#{cs}") )
    %Q{
      <script type="text/javascript">
        $(document).ready(function() {
          $('#sortable').sortable( {
            dropOnEmpty: false,
            cursor: 'crosshair',
            opacity: 0.75,
            scroll: true,
            update: function() {
              $.ajax( {
                type: 'post',
                data: $('#sortable').sortable('serialize') + '&authenticity_token=#{u(form_authenticity_token)}',
                dataType: 'script',
                url: '#{script_path}'})
              }
            });
          });
      </script>
    }.gsub(/[\n ]+/, ' ').strip.html_safe
  end
end
