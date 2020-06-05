from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort

from pykiosk.auth import login_required
from pykiosk.db import get_db

bp = Blueprint('order', __name__)


@bp.route('/order_list')
@login_required
def lists():
    db = get_db()
    orders = db.execute(
        'SELECT o.id, order_time, total_cost, rfid_user_id, r_name, user_id, username '
        ' FROM orders o JOIN user u ON o.user_id = u.id '
        ' JOIN rfid_user r ON o.rfid_user_id = r.id'
        ' ORDER BY order_time DESC'
    ).fetchall()
    print(orders)
    return render_template('/order/order_list.html', orders=orders)


@bp.route('/order')
@login_required
def order():
    return render_template('/order/order.html', orders=orders)



