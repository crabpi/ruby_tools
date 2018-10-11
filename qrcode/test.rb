require 'rqrcode'


# image = qrcode.as_png
# svg = qrcode.as_svg
# html = qrcode.as_html
# string = qrcode.as_ansi
# string = qrcode.to_s
# puts string
# png = qrcode.as_png(
#     resize_gte_to: false,
#     resize_exactly_to: false,
#     fill: 'white',
#     color: 'black',
#     size: 120,
#     border_modules: 4,
#     module_px_size: 6,
#     file: nil # path to write
#     # file:"test.png"
# )
# IO.write("qrcode.png", png.to_s)
def make_qrcode(text)
    RQRCode::QRCode.new(text).as_ansi
end
puts make_qrcode(ARGV.first)