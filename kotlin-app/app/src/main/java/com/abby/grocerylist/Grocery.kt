package com.abby.grocerylist

/**
 * Grocery class containing a grocery.
 *
 * This class also provides some methods to handle database transactions with groceries.
 */
class Grocery(
    private val id: String = "",
    val done: Boolean = false,
    val item: String = ""
) {

    /**
     * Add this grocery to the database.
     */
    fun store() {
        FirebaseHelper().collection.document(System.currentTimeMillis().toString()).set(this)
    }

    /**
     * Update this grocery in the database. The item of the grocery never changes, only whether it is
     * done or not.
     */
    fun update(newDone: Boolean) {
        FirebaseHelper().collection.document(id).update("done", newDone)
    }

    /**
     * Permanently delete this item from the database.
     */
    fun delete() {
        FirebaseHelper().collection.document(id).delete()
    }
}