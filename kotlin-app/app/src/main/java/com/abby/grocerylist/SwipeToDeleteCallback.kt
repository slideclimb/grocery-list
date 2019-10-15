package com.abby.grocerylist

import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import android.graphics.drawable.Drawable
import androidx.core.content.res.ResourcesCompat
import androidx.recyclerview.widget.ItemTouchHelper
import androidx.recyclerview.widget.RecyclerView

class SwipeToDeleteCallback(
    val context: Context,
    private val adapter: GroceriesAdapter,
    private val icon: Drawable? = ResourcesCompat.getDrawable(
        context.resources,
        R.drawable.ic_delete,
        null
    ),
    private val background: ColorDrawable = ColorDrawable(Color.RED)
) :
    ItemTouchHelper.SimpleCallback(0, ItemTouchHelper.LEFT) {

    override fun onSwiped(viewHolder: RecyclerView.ViewHolder, direction: Int) {
        val position = viewHolder.adapterPosition
        adapter.groceries[position].delete()
    }

    override fun onChildDraw(
        c: Canvas,
        recyclerView: RecyclerView,
        viewHolder: RecyclerView.ViewHolder,
        dX: Float,
        dY: Float,
        actionState: Int,
        isCurrentlyActive: Boolean
    ) {
        super.onChildDraw(c, recyclerView, viewHolder, dX, dY, actionState, isCurrentlyActive)

        val itemView = viewHolder.itemView

        val iconMargin = (itemView.height - icon!!.intrinsicHeight) / 2
//        val iconTop = itemView.top + iconMargin
//        val iconBottom = iconTop + icon.intrinsicHeight

        if (dX < 0) {
            icon.setBounds(
                itemView.right - iconMargin - icon.intrinsicWidth,
                itemView.top + iconMargin,
                itemView.right - iconMargin,
                itemView.top + iconMargin + icon.intrinsicHeight
            )
            // Draw the red background when swiping an item to the left.
            background.setBounds(
                itemView.right + dX.toInt(),
                itemView.top,
                itemView.right,
                itemView.bottom
            )
        } else {
            background.setBounds(0, 0, 0, 0)
        }
        background.draw(c)
        icon.draw(c)
    }

    override fun onMove(
        recyclerView: RecyclerView,
        viewHolder: RecyclerView.ViewHolder,
        target: RecyclerView.ViewHolder
    ): Boolean {
        return false
    }
}
